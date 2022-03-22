export default ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', '592086a72f9a7fe00c1ba52e74a6c47b'),
  },
});
