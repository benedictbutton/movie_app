export const required = value =>
  value || typeof value === "number" ? undefined : "Required";
export const maxLength = max => value =>
  value && value.length > max ? `Must be ${max} characters or less` : undefined;
export const maxLength15 = maxLength(15);
export const minLength = min => value =>
  value && value.length < min ? `Must be ${min} characters or more` : undefined;
export const minLength2 = minLength(2);
export const minLength7 = minLength(7);
export const email = value =>
  value && !/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i.test(value)
    ? "Invalid email address"
    : undefined;
export const alphaNumeric = value =>
  value && /[^a-zA-Z0-9 ]/i.test(value)
    ? "Only alphanumeric characters"
    : undefined;
export const passwordsMatch = (value, allValues) =>
  value !== allValues.password ? "Passwords don't match" : undefined;
export const passwordLowercase = value =>
  value && !/[a-z]/.test(value)
    ? "Must contain at least one lowercase letter"
    : undefined;
export const passwordUppercase = value =>
  value && !/[A-Z]/.test(value)
    ? "Must contain at least one uppercase letter"
    : undefined;
export const passwordNumber = value =>
  value && !/[0-9]/.test(value)
    ? "Must contain at least one number"
    : undefined;
