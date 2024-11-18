function fn() {
  var env = karate.env;
 var baseURLReqRes = ''

  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }

  if (env == 'dev') {
    baseURLReqRes = 'https://petstore.swagger.io/v2'

  } else if (env == 'cert') {

 baseURLReqRes = 'https://petstore.swagger.io/v2'
  }

var config = {
    env: env,
    baseURLReqRes : baseURLReqRes,
    myVarName: 'someValue'
  }


  return config;
}