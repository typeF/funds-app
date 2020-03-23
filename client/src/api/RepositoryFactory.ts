import ShopsRepository from "./ShopsRepository";
import StocksRepository from "./StocksRepository";

const respositories: any = {
  shops: ShopsRepository,
  stocks: StocksRepository
};

export const RepositoryFactory = {
  get: (name: string) => respositories[name]
};
