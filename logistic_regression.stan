data {
  int < lower =0 > N; # Number of observations in training set
  int < lower =0 > J; # Number of columns in training set
  matrix [N,J] x; # Training dataset
  int<lower=0, upper=1> y[N]; # Target
  
  int N_test; # Number of observations in testing set
  int <lower=0> K; # Number of columns in testing set
  matrix[N_test, K] x_test; # Testing dataset
  int y_test[N_test];
}

parameters {
  real alpha;
  vector [J ] beta ;
}

model {
  alpha ~ normal(0,2);
  beta ~ normal(0,2);
  y ~ bernoulli_logit(alpha + x * beta);
}

generated quantities {
  vector[N_test] E_y_test = inv_logit(alpha + x_test * beta);
  real log_loss = -bernoulli_logit_lpmf(y_test | alpha + x_test * beta);
  real sq_loss = dot_self(to_vector(y_test) - E_y_test);
}

