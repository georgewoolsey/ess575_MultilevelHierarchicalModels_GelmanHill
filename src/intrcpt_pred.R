
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
    # beta
      beta ~ dnorm(0, .0001)
    # y priors
      sigma.y ~ dunif (0, 100)
      tau.y <- 1/sigma.y^2
    ###########################
    # likelihood
    ###########################
    for (i in 1:n){
      mu.y[i] <- alpha[county[i]] + beta * x[i]
      y[i] ~ dnorm(mu.y[i], tau.y)
    }
  }
  
