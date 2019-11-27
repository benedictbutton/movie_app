const responseJson = {
  id: 7,
  firstName: "test",
  lastName: "user",
  username: "testuser",
  email: "testuser@email.com"
};

export default function fetchUser() {
  return { responseJson };
}
