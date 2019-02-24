class CustomError extends Error {
  constructor(message, code) {
    super(message, code);
    this.message = message;
    this.code = code;
  }
}

export default CustomError;
