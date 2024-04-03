local claims = std.extVar('claims');
{
  identity: {
    traits: {
      name: {
        [if 'given_name' in claims then 'first_name' else null]: claims.given_name,
        [if 'family_name' in claims then 'last_name' else null]: claims.family_name,
      },

      [if   'raw_claims' in claims &&
        'groups' in claims.raw_claims then 'idp_groups' else null]: claims.raw_claims.groups,

      [if 'preferred_username' in claims then 'email' else null]: claims.preferred_username,
      [if 'email' in claims then 'email' else null]: claims.email,
    },
  },
}
