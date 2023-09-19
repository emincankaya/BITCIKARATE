function fn() {
    var env = karate.env; // get system property 'karate.env'

    karate.log('karate.env system property was:', env);
    if (!env) {
        env = 'dev';
    }
    var config = {
        env: env,
        myVarName: 'someValue',
        baseURI: 'https://test.bitci.tech',
        apiToken: 'nkM+r4QxK0END2A9p/DpzV4dZ6uTbBcKjSBNYLv1LwVAUQkrW77FzGc3TqsO/v4Et0mVhNhD0rk2nkTumHwSrinxv3NxnXUKAy83JZ8D2zJeAv/gd6W2pyqaJYlrLuZoMOOwxuAW2GOi0Bj7jdg1MGOnpU2z2+iRiRiwttJgVJHv94BHtYMVbpWFtwcXqsQg'
    }
    var generalTokenResult = karate.callSingle('classpath:caller/CreateToken/CreateTokenFile.feature@create_token_caller', config);
    config.generalToken = generalTokenResult.response.Token;
    var generalTokenResult = karate.callSingle('classpath:caller/CreateToken/CreateTokenFile.feature@create_token_caller2', config);
    config.generalToken2 = generalTokenResult.response.Token;
    var CoinBalanceDetail = karate.callSingle('classpath:caller/CoinBalanceDetail/CoinBlanceDetailCaller.feature@coinbalancedetail_caller',config);
    config.CurrentPrice=CoinBalanceDetail.response.CurrentPrice;
    karate.configure('headers', {'Content-Type': 'application/json'});
    karate.configure('headers', {'Cap': '-1'})








    return config;
}