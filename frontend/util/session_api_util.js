const postUser = (user) => {
  return $.ajax ({
    method: "POST",
    url: '/api/users',
    data: { user: user }
  });
};

const postSession = (user) => {
  return $.ajax ({
    method: "POST",
    url: '/api/session',
    data: { user: user }
  });
};

const deleteSession = (user) => {
  return $.ajax ({
    method: "DELETE",
    url: '/api/session',
    data: { user: user }
  });
};
