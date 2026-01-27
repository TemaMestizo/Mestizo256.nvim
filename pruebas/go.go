package main

import (
	"fmt"
	"math/rand"
	"sort"
	"strings"
	"time"
)

// Employee representa un empleado de la empresa
type Employee struct {
	ID         int
	Name       string
	Department string
	Salary     float64
	HireDate   time.Time
	IsActive   bool
}

// Department representa un departamento
type Department struct {
	Name      string
	Budget    float64
	Employees []*Employee
}

// Company representa la empresa completa
type Company struct {
	Name        string
	Departments map[string]*Department
	Employees   []*Employee
}

// NewCompany crea una nueva instancia de Company
func NewCompany(name string) *Company {
	return &Company{
		Name:        name,
		Departments: make(map[string]*Department),
		Employees:   make([]*Employee, 0),
	}
}

// AddDepartment agrega un departamento a la empresa
func (c *Company) AddDepartment(name string, budget float64) {
	dept := &Department{
		Name:      name,
		Budget:    budget,
		Employees: make([]*Employee, 0),
	}
	c.Departments[name] = dept
}

// HireEmployee contrata un nuevo empleado
func (c *Company) HireEmployee(name, department string, salary float64) error {
	dept, exists := c.Departments[department]
	if !exists {
		return fmt.Errorf("departamento %s no existe", department)
	}

	employee := &Employee{
		ID:         len(c.Employees) + 1,
		Name:       name,
		Department: department,
		Salary:     salary,
		HireDate:   time.Now(),
		IsActive:   true,
	}

	c.Employees = append(c.Employees, employee)
	dept.Employees = append(dept.Employees, employee)
	return nil
}

// FireEmployee despide a un empleado
func (c *Company) FireEmployee(id int) error {
	for _, emp := range c.Employees {
		if emp.ID == id {
			emp.IsActive = false
			return nil
		}
	}
	return fmt.Errorf("empleado con ID %d no encontrado", id)
}

// GetTotalPayroll calcula la nómina total
func (c *Company) GetTotalPayroll() float64 {
	total := 0.0
	for _, emp := range c.Employees {
		if emp.IsActive {
			total += emp.Salary
		}
	}
	return total
}

// GetDepartmentPayroll calcula la nómina de un departamento
func (c *Company) GetDepartmentPayroll(deptName string) (float64, error) {
	dept, exists := c.Departments[deptName]
	if !exists {
		return 0, fmt.Errorf("departamento %s no existe", deptName)
	}

	total := 0.0
	for _, emp := range dept.Employees {
		if emp.IsActive {
			total += emp.Salary
		}
	}
	return total, nil
}

// GetTopEarners retorna los empleados con mayor salario
func (c *Company) GetTopEarners(n int) []*Employee {
	activeEmployees := make([]*Employee, 0)
	for _, emp := range c.Employees {
		if emp.IsActive {
			activeEmployees = append(activeEmployees, emp)
		}
	}

	sort.Slice(activeEmployees, func(i, j int) bool {
		return activeEmployees[i].Salary > activeEmployees[j].Salary
	})

	if n > len(activeEmployees) {
		n = len(activeEmployees)
	}

	return activeEmployees[:n]
}

// GiveRaise otorga un aumento porcentual a un empleado
func (c *Company) GiveRaise(id int, percentage float64) error {
	for _, emp := range c.Employees {
		if emp.ID == id && emp.IsActive {
			emp.Salary *= (1 + percentage/100)
			return nil
		}
	}
	return fmt.Errorf("empleado activo con ID %d no encontrado", id)
}

// GetAverageSalary calcula el salario promedio
func (c *Company) GetAverageSalary() float64 {
	count := 0
	total := 0.0
	for _, emp := range c.Employees {
		if emp.IsActive {
			total += emp.Salary
			count++
		}
	}
	if count == 0 {
		return 0
	}
	return total / float64(count)
}

// GetEmployeesByDepartment agrupa empleados por departamento
func (c *Company) GetEmployeesByDepartment() map[string][]*Employee {
	result := make(map[string][]*Employee)
	for _, emp := range c.Employees {
		if emp.IsActive {
			result[emp.Department] = append(result[emp.Department], emp)
		}
	}
	return result
}

// GenerateReport genera un reporte completo de la empresa
func (c *Company) GenerateReport() string {
	var sb strings.Builder

	sb.WriteString(fmt.Sprintf("=== Reporte de %s ===\n\n", c.Name))
	sb.WriteString(fmt.Sprintf("Total de empleados activos: %d\n", c.countActiveEmployees()))
	sb.WriteString(fmt.Sprintf("Nómina total: $%.2f\n", c.GetTotalPayroll()))
	sb.WriteString(fmt.Sprintf("Salario promedio: $%.2f\n\n", c.GetAverageSalary()))

	sb.WriteString("Departamentos:\n")
	for name, dept := range c.Departments {
		activeCount := 0
		for _, emp := range dept.Employees {
			if emp.IsActive {
				activeCount++
			}
		}
		payroll, _ := c.GetDepartmentPayroll(name)
		sb.WriteString(fmt.Sprintf("  - %s: %d empleados, Nómina: $%.2f, Presupuesto: $%.2f\n",
			name, activeCount, payroll, dept.Budget))
	}

	sb.WriteString("\nTop 5 empleados mejor pagados:\n")
	topEarners := c.GetTopEarners(5)
	for i, emp := range topEarners {
		sb.WriteString(fmt.Sprintf("  %d. %s (%s): $%.2f\n",
			i+1, emp.Name, emp.Department, emp.Salary))
	}

	return sb.String()
}

// countActiveEmployees cuenta empleados activos
func (c *Company) countActiveEmployees() int {
	count := 0
	for _, emp := range c.Employees {
		if emp.IsActive {
			count++
		}
	}
	return count
}

// SearchEmployees busca empleados por nombre
func (c *Company) SearchEmployees(query string) []*Employee {
	results := make([]*Employee, 0)
	query = strings.ToLower(query)

	for _, emp := range c.Employees {
		if emp.IsActive && strings.Contains(strings.ToLower(emp.Name), query) {
			results = append(results, emp)
		}
	}

	return results
}

// CalculateTenure calcula años de antigüedad
func (e *Employee) CalculateTenure() float64 {
	duration := time.Since(e.HireDate)
	return duration.Hours() / 24 / 365.25
}

// String implementa el Stringer para Employee
func (e *Employee) String() string {
	status := "Activo"
	if !e.IsActive {
		status = "Inactivo"
	}
	return fmt.Sprintf("ID: %d | %s | %s | $%.2f | %s",
		e.ID, e.Name, e.Department, e.Salary, status)
}

// SalaryStatistics contiene estadísticas salariales
type SalaryStatistics struct {
	Min    float64
	Max    float64
	Avg    float64
	Median float64
}

// GetSalaryStatistics calcula estadísticas salariales
func (c *Company) GetSalaryStatistics() SalaryStatistics {
	salaries := make([]float64, 0)
	for _, emp := range c.Employees {
		if emp.IsActive {
			salaries = append(salaries, emp.Salary)
		}
	}

	if len(salaries) == 0 {
		return SalaryStatistics{}
	}

	sort.Float64s(salaries)

	stats := SalaryStatistics{
		Min: salaries[0],
		Max: salaries[len(salaries)-1],
		Avg: c.GetAverageSalary(),
	}

	// Calcular mediana
	if len(salaries)%2 == 0 {
		stats.Median = (salaries[len(salaries)/2-1] + salaries[len(salaries)/2]) / 2
	} else {
		stats.Median = salaries[len(salaries)/2]
	}

	return stats
}

func main() {
	rand.Seed(time.Now().UnixNano())

	// Crear empresa
	company := NewCompany("TechCorp Industries")

	// Agregar departamentos
	company.AddDepartment("Ingeniería", 500000)
	company.AddDepartment("Marketing", 300000)
	company.AddDepartment("Ventas", 400000)
	company.AddDepartment("Recursos Humanos", 200000)
	company.AddDepartment("Finanzas", 350000)

	// Contratar empleados
	employees := []struct {
		name       string
		department string
		salary     float64
	}{
		{"Ana García", "Ingeniería", 85000},
		{"Carlos Martínez", "Ingeniería", 92000},
		{"María López", "Marketing", 65000},
		{"Juan Pérez", "Ventas", 70000},
		{"Laura Rodríguez", "Ingeniería", 88000},
		{"Pedro Sánchez", "Finanzas", 75000},
		{"Carmen Fernández", "Recursos Humanos", 60000},
		{"José Torres", "Ventas", 68000},
		{"Isabel Ramírez", "Marketing", 72000},
		{"Francisco Díaz", "Ingeniería", 95000},
		{"Lucía Moreno", "Finanzas", 78000},
		{"Miguel Ángel Ruiz", "Ventas", 73000},
		{"Elena Jiménez", "Marketing", 67000},
		{"Antonio Álvarez", "Ingeniería", 90000},
		{"Rosa Romero", "Recursos Humanos", 62000},
	}

	for _, emp := range employees {
		err := company.HireEmployee(emp.name, emp.department, emp.salary)
		if err != nil {
			fmt.Printf("Error al contratar a %s: %v\n", emp.name, err)
		}
	}

	// Simular algunas operaciones
	fmt.Println("=== Operaciones de la Empresa ===\n")

	// Dar aumentos aleatorios
	fmt.Println("Otorgando aumentos...")
	for i := 1; i <= 5; i++ {
		raise := float64(rand.Intn(15) + 5) // 5-20%
		company.GiveRaise(i, raise)
		fmt.Printf("Empleado ID %d recibió un aumento del %.1f%%\n", i, raise)
	}
	fmt.Println()

	// Despedir un empleado
	fmt.Println("Despidiendo empleado...")
	company.FireEmployee(8)
	fmt.Println("Empleado ID 8 ha sido despedido\n")

	// Buscar empleados
	fmt.Println("Buscando empleados con 'María'...")
	results := company.SearchEmployees("María")
	for _, emp := range results {
		fmt.Println("  -", emp.String())
	}
	fmt.Println()

	// Generar reporte completo
	fmt.Println(company.GenerateReport())

	// Mostrar estadísticas salariales
	stats := company.GetSalaryStatistics()
	fmt.Println("\n=== Estadísticas Salariales ===")
	fmt.Printf("Salario mínimo: $%.2f\n", stats.Min)
	fmt.Printf("Salario máximo: $%.2f\n", stats.Max)
	fmt.Printf("Salario promedio: $%.2f\n", stats.Avg)
	fmt.Printf("Salario mediana: $%.2f\n", stats.Median)

	// Mostrar empleados por departamento
	fmt.Println("\n=== Empleados por Departamento ===")
	byDept := company.GetEmployeesByDepartment()
	for dept, emps := range byDept {
		fmt.Printf("\n%s (%d empleados):\n", dept, len(emps))
		for _, emp := range emps {
			tenure := emp.CalculateTenure()
			fmt.Printf("  - %s (Antigüedad: %.1f años)\n", emp.Name, tenure)
		}
	}
}
