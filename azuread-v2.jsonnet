local claims = std.extVar('claims');
{
  identity: {
    traits: {
      // Allowing unverified email addresses enables account
      // enumeration attacks,  if the value is used for
      // verification or as a password login identifier.
      //
      // If connecting only to your organization (one tenant), claims.email is safe to use
      // if you haven't actively disabled e-mail verification during sign-up.
      //
      // The email might be empty if the account isn't linked to an email address.
      // For a human readable identifier, consider using the "preferred_username" claim.
      [if 'email' in claims then 'email' else null]: claims.email,
      [if "given_name" in claims then "first_name" else null]: claims.given_name,
      [if "family_name" in claims then "last_name" else null]: claims.family_name,
      [if "groups" in claims.raw_claims then "idp_groups" else null]: claims.raw_claims.groups,
    },
  },
}
