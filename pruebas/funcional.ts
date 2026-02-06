  export class Tubo<T> {
    constructor(public valor: T){}

    public t<K>(fn: (valor: T) => K): Tubo<K> {
      return new Tubo(fn(this.valor))
    }
  }

  export function map<T, K>(iterador: (valor: T) => K): (arreglo: T[]) => K[] {
    return (arreglo: T[]): K[] => {
      let nuevoArreglo: K[] =[]

      for (let i = 0; i < arreglo.length; i++) {
        const elemento = arreglo[i];
        nuevoArreglo.push(iterador(elemento))
      }

      return nuevoArreglo
    }
  }

  export function filtrar<T, K>(filtro: (valor: T) => valor is K): K[] {}

  interface Planeta {
    nombre: string;
    color: "azul" | "rojo" | "amarillo";
  }

  const planetas: Planeta[] = [
    { nombre: "Tierra", color: "azul" },
    { nombre: "Marte", color: "rojo" },
    { nombre: "Saturno", color: "amarillo" },
  ]

  const nuevo = new Tubo(planetas)
    .t(map((valor) => {
      if (valor.color === "rojo") return valor
    }))
    .t(console.log)
