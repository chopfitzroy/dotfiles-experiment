import type { Dispatch, ReactNode, SetStateAction } from 'react';

import { useState, useContext, createContext } from 'react';

interface TemplateContextValues {
  count: number;
  setCount: Dispatch<SetStateAction<number>>;
}

interface TemplateProviderProps {
  children: ReactNode;
}

const TemplateContext = createContext<undefined | TemplateContextValues>(undefined);


function TemplateProvider({ children }: TemplateProviderProps) {
  const [count, setCount] = useState(0);
  const value = { count, setCount }
  return <TemplateContext.Provider value={value}>{children}</TemplateContext.Provider>
}

function useTemplateContext() {
  const context = useContext(TemplateContext)
  if (context === undefined) {
    throw new Error('useTemplateContext must be used within a TemplateProvider')
  }
  return context
}

export {TemplateProvider, useTemplateContext}