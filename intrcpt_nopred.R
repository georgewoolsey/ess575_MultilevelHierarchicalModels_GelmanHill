
  ## JAGS Model
  model {
    ###########################
    # priors
    ###########################
    # alpha priors
      mu.alpha ~ dnorm(0, .0001)
      tau.alpha <- 1/sigma.alpha^2
      sigma.alpha ~ dunif(0, 100)
      for (j in 1:J){
        alpha[j] ~ dnorm(mu.alpha, tau.alpha)
      }
    # y priors
      sigma.y ~ dunif (0, 100)
      tau.y <- 1/sigma.y^2
    ###########################
    # likelihood
    ###########################
    for (i in 1:n){
      y[i] ~ dnorm(alpha[county[i]], tau.y)
    }
  }
  
