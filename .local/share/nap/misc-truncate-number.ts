const truncateNumner = (num: number, digits: number = 2) => {
  return Math.trunc(num * Math.pow(10, digits)) / Math.pow(10, digits);
} 
