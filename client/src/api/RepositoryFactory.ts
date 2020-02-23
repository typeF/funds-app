import ShopsRepository from "./ShopsRepository";

const respositories = {
  shops: ShopsRepository
};

export const RepositoryFactory = {
  get: (name: string) => respositories[name]
};
