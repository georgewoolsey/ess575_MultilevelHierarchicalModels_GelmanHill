
  ## JAGS Model
  model {
    ###########################
    # priors
    ###########################
    # alpha priors
      gamma_0 ~ dnorm (0, .0001)
      gamma_1 ~ dnorm (0, .0001)
      sigma.alpha ~ dunif(0, 100)
      tau.alpha <- 1/sigma.alpha^2
    # beta
      beta ~ dnorm(0, .0001)
    # y priors
      sigma.y ~ dunif (0, 100)
      tau.y <- 1/sigma.y^2
    ###########################
    # likelihood
    ###########################
    # intercept (alpha) likelihood
      # represent the effect of soil carbon ...
        # ...on the intercept using the deterministic model below to predict alpha_j
      for(j in 1:J){
        mu_alpha[j] <- gamma_0 + gamma_1 * u[j]
        alpha[j] ~ dnorm(mu_alpha[j], tau.alpha)
      }
    # y
    for (i in 1:n){
      mu.y[i] <- alpha[county[i]] + beta * x[i]
      y[i] ~ dnorm(mu.y[i], tau.y)
    }
  }
  
