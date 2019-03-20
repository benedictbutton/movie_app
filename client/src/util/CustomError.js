class CustomError extends Error {
  constructor(message, code, status) {
    super(message, code);
    this.message = message;
    this.code = code;
    this.status = status;
  }
}

export default CustomError;
