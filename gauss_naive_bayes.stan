data {
  int<lower=0> J;                        // Number of feautures
  int<lower=0> N;                        // Number of instances
  int<lower=0> N_test;                        // Number of test instances
  int<lower=0> N_benign;                 // Number of benign instances
  int<lower=0> N_malign;                 // Number of malign instances
  int<lower=0, upper=1> target_train[N];        // Target
  int<lower=0, upper=1> target_test[N_test];        // Target
  vector[J] benign[N_benign];            // Benign data
  vector[J] malign[N_malign];            // Malignant data
  vector[J] test[N_test];
  
}

parameters {
  // Benign Parameters:
  vector[J] mu_benign;
  vector<lower=0>[J] sigma_benign;
  // Malignant Parameters:
  vector[J] mu_malign;
  vector<lower=0>[J] sigma_malign;
  // Target Parameters:
  real<lower=0, upper=1> theta;
}

model {
  // Prior:
  theta ~ beta(10, 10);
  
  for (j in 1:J) {
    mu_benign[j] ~ normal(20, 100);
    sigma_benign[j] ~ inv_chi_square(0.1);
    mu_malign[j] ~ normal(20, 100);
    sigma_malign[j] ~ inv_chi_square(0.1);
  }
  
  // Likelihood:
  target_train ~ bernoulli(theta);
  
  for (j in 1:J) {
    benign[, j] ~ normal(mu_benign[j], sigma_benign[j]);
    malign[, j] ~ normal(mu_malign[j], sigma_malign[j]);
  }
}

generated quantities {
  int<lower=0, upper=1> ypred[N_test];
  real<lower=0, upper=100> accuracy = 0;
  
  # Gaussian naive bayes classifier:
  for (i in 1:N_test) {
    # Class prior
    real be = bernoulli_lpmf(0 | 1 - theta);
    real ma = bernoulli_lpmf(1 | theta);
    # Data likelihood:
    for (j in 1:J) {
      be += normal_lpdf(test[i, j] | mu_benign[j], sigma_benign[j]);
      ma += normal_lpdf(test[i, j] | mu_malign[j], sigma_malign[j]);
    }
    # Classification:
    if (ma >= be) {
      ypred[i] = 1;
    }
    else {
      ypred[i] = 0;
    }
    if (ypred[i] == target_test[i]) {
      accuracy += 1;
    }
  }
  # Accuracy:
  accuracy = accuracy * 100.0 / N_test;
}

