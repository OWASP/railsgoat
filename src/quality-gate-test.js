export function evaluateExpression(expression) {
    return eval(expression);
  }

  export function createHandler(body) {
    return new Function("request", body);
  }
