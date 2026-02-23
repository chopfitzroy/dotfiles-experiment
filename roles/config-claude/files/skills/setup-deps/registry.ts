/**
 * Registry of packages that benefit from local source access
 *
 * This file can be updated by users or via pull requests to add more packages.
 * Each package can have multiple resources (source, docs, examples, etc.)
 */

export type Resource = {
  url: string;           // Git repository URL
  reason: string;        // Why this resource helps
};

export type PackageEntry = {
  name: string;          // Package name or glob pattern (e.g., "@effect/*")
  resources: {
    [resourceName: string]: Resource;  // e.g., "source", "docs", "examples"
  };
};

export type Registry = {
  npm: PackageEntry[];
  composer: PackageEntry[];
  cargo: PackageEntry[];
  pypi: PackageEntry[];
  go: PackageEntry[];
  rubygems: PackageEntry[];
};

export const REGISTRY: Registry = {
  // Node.js / npm packages
  npm: [
    {
      name: "effect",
      resources: {
        source: {
          url: "https://github.com/Effect-TS/effect",
          reason: "Complex API, docs focus on concepts not implementation"
        },
        docs: {
          url: "https://github.com/Effect-TS/website",
          reason: "Documentation source with examples"
        }
      }
    },
    {
      name: "@effect/*",
      resources: {
        source: {
          url: "https://github.com/Effect-TS/effect",
          reason: "Monorepo containing all @effect/* packages"
        }
      }
    },
    {
      name: "react-router",
      resources: {
        source: {
          url: "https://github.com/remix-run/react-router",
          reason: "Router internals and loader patterns"
        },
        docs: {
          url: "https://github.com/remix-run/react-router-website",
          reason: "Documentation with detailed examples"
        }
      }
    },
    {
      name: "zod",
      resources: {
        source: {
          url: "https://github.com/colinhacks/zod",
          reason: "Advanced inference patterns not fully documented"
        }
      }
    },
    {
      name: "drizzle-orm",
      resources: {
        source: {
          url: "https://github.com/drizzle-team/drizzle-orm",
          reason: "Fast-moving API, docs lag behind source"
        }
      }
    },
    {
      name: "hono",
      resources: {
        source: {
          url: "https://github.com/honojs/hono",
          reason: "Middleware patterns clearer in source"
        }
      }
    },
    {
      name: "vite",
      resources: {
        source: {
          url: "https://github.com/vitejs/vite",
          reason: "Plugin API and build internals"
        }
      }
    },
    {
      name: "next",
      resources: {
        source: {
          url: "https://github.com/vercel/next.js",
          reason: "App router and server components implementation"
        }
      }
    }
  ],

  // PHP / Composer packages
  composer: [
    {
      name: "laravel/framework",
      resources: {
        source: {
          url: "https://github.com/laravel/framework",
          reason: "Deep internals often needed for debugging"
        },
        docs: {
          url: "https://github.com/laravel/docs",
          reason: "Version-specific documentation"
        }
      }
    },
    {
      name: "symfony/symfony",
      resources: {
        source: {
          url: "https://github.com/symfony/symfony",
          reason: "Component internals and dependency injection"
        }
      }
    }
  ],

  // Rust / Cargo packages
  cargo: [
    {
      name: "tokio",
      resources: {
        source: {
          url: "https://github.com/tokio-rs/tokio",
          reason: "Async runtime internals"
        }
      }
    },
    {
      name: "axum",
      resources: {
        source: {
          url: "https://github.com/tokio-rs/axum",
          reason: "Extractors and middleware patterns"
        }
      }
    },
    {
      name: "serde",
      resources: {
        source: {
          url: "https://github.com/serde-rs/serde",
          reason: "Derive macro implementation details"
        }
      }
    }
  ],

  // Python / PyPI packages
  pypi: [
    {
      name: "pydantic",
      resources: {
        source: {
          url: "https://github.com/pydantic/pydantic",
          reason: "Validator internals and edge cases"
        }
      }
    },
    {
      name: "fastapi",
      resources: {
        source: {
          url: "https://github.com/tiangolo/fastapi",
          reason: "Dependency injection patterns"
        }
      }
    },
    {
      name: "django",
      resources: {
        source: {
          url: "https://github.com/django/django",
          reason: "ORM internals and middleware chain"
        }
      }
    }
  ],

  // Go packages
  go: [
    {
      name: "github.com/labstack/echo",
      resources: {
        source: {
          url: "https://github.com/labstack/echo",
          reason: "Middleware chain internals"
        }
      }
    },
    {
      name: "github.com/gin-gonic/gin",
      resources: {
        source: {
          url: "https://github.com/gin-gonic/gin",
          reason: "Router and context implementation"
        }
      }
    }
  ],

  // Ruby / RubyGems packages
  rubygems: [
    {
      name: "rails",
      resources: {
        source: {
          url: "https://github.com/rails/rails",
          reason: "ActiveRecord internals, callbacks"
        }
      }
    }
  ]
};

/**
 * Match a package name against a registry entry
 * Supports glob patterns like "@effect/*"
 */
export function matchesPackage(packageName: string, registryName: string): boolean {
  // Exact match
  if (packageName === registryName) {
    return true;
  }

  // Glob pattern match (simple implementation for "prefix/*")
  if (registryName.endsWith("/*")) {
    const prefix = registryName.slice(0, -2);
    return packageName.startsWith(prefix);
  }

  return false;
}
