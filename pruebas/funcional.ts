  interface Tuberia<T> {
  (): T;
  t: <K>(fn: (valor: T) => K) => Tuberia<K>;
}

function Tubo<T>(valor: T): Tuberia<T> {
  const fn = () => valor;
  const t: Tuberia<T>["t"] = (fn) => Tubo(fn(valor));

  return Object.assign(fn, {
    t,
  });
}

function map<T, K>(iterador: (valor: T, i: number) => K) {
  return (arreglo: T[]): K[] => {
    const nuevoArreglo: K[] = [];

    for (let i = 0; i < arreglo.length; i++) {
      // biome-ignore lint/style/noNonNullAssertion: Sa vaina sí exite
      const elemento = arreglo[i]!;
      nuevoArreglo.push(iterador(elemento, i));
    }

    return nuevoArreglo;
  };
}

function filtrar<T, K extends T>(
  filtro: (valor: T, indice: number) => valor is K,
) {
  return (arreglo: T[]): K[] => {
    const nuevoArreglo: K[] = [];

    for (let i = 0; i < arreglo.length; i++) {
      // biome-ignore lint/style/noNonNullAssertion: Sa vaina sí exite
      const elemento = arreglo[i]!;

      if (filtro(elemento, i)) {
        nuevoArreglo.push(elemento);
      }
    }

    return nuevoArreglo;
  };
}

function inspeccionar<T>(
  registrador: Console["log" | "info" | "warn" | "error" | "debug"],
) {
  return (valor: T) => {
    registrador(valor);
    return valor;
  };
}

function fusionarObjetos<T>(arreglo: T[]): T {
  if (arreglo.length < 1) {
    throw new Error("El arreglo no puede estar vacío");
  }

  // biome-ignore lint/style/noNonNullAssertion: Ya esta verificado
  const nuevoObjeto = arreglo[0]!;

  for (let i = 1; i < arreglo.length; i++) {
    // biome-ignore lint/style/noNonNullAssertion: Sa vaina sí exite
    const elemento = arreglo[i]!;
    Object.assign(nuevoObjeto, elemento);
  }

  return nuevoObjeto;
}

interface ConstructorDeObjeto<T, K> {
  clave: T;
  valor: K;
}

function objetoAArreglo<T extends Record<keyof T, T[keyof T]>>(objeto: T) {
  const nuevoArreglo: ConstructorDeObjeto<keyof T, T[keyof T]>[] = [];

  for (const [clave, valor] of Object.entries(objeto)) {
    nuevoArreglo.push({ clave: clave as keyof T, valor: valor as T[keyof T] });
  }

  return nuevoArreglo;
}

interface Planeta {
  nombre: string;
  masa: number;
}

// Se asigna a una constante para ver los tipos gracias a los inlay hints
const planetas = Tubo<Planeta[]>([
  { nombre: "Mercurio", masa: 0.0553 },
  { nombre: "Venus", masa: 0.815 },
  { nombre: "Marte", masa: 0.642 },
  { nombre: "Júpiter", masa: 1.9 },
])
  .t(map((planeta) => (planeta.masa < 1 ? planeta : null)))
  .t(filtrar((planeta): planeta is Planeta => planeta !== null))
  .t(fusionarObjetos)
  .t(objetoAArreglo)
  .t(map((valor) => valor.clave + valor.valor))
  .t(inspeccionar(console.log));
// .t(console.log);

