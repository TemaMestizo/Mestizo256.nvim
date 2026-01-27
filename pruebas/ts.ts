// ============================================================================
// Sistema de Gestión de Tareas con TypeScript
// ============================================================================

// Tipos y Enumeraciones
enum TaskPriority {
  LOW = 'low',
  MEDIUM = 'medium',
  HIGH = 'high',
  URGENT = 'urgent'
}

enum TaskStatus {
  TODO = 'todo',
  IN_PROGRESS = 'in_progress',
  REVIEW = 'review',
  COMPLETED = 'completed',
  CANCELLED = 'cancelled'
}

enum TaskCategory {
  WORK = 'work',
  PERSONAL = 'personal',
  SHOPPING = 'shopping',
  HEALTH = 'health',
  EDUCATION = 'education'
}

// Interfaces
interface User {
  id: string;
  name: string;
  email: string;
  role: 'admin' | 'user' | 'guest';
  createdAt: Date;
}

interface Task {
  id: string;
  title: string;
  description: string;
  priority: TaskPriority;
  status: TaskStatus;
  category: TaskCategory;
  assignedTo: string | null;
  createdBy: string;
  createdAt: Date;
  updatedAt: Date;
  dueDate: Date | null;
  tags: string[];
  subtasks: Subtask[];
  comments: Comment[];
  attachments: Attachment[];
}

interface Subtask {
  id: string;
  title: string;
  completed: boolean;
  createdAt: Date;
}

interface Comment {
  id: string;
  userId: string;
  content: string;
  createdAt: Date;
  edited: boolean;
}

interface Attachment {
  id: string;
  name: string;
  url: string;
  type: string;
  size: number;
  uploadedAt: Date;
}

interface TaskFilter {
  status?: TaskStatus[];
  priority?: TaskPriority[];
  category?: TaskCategory[];
  assignedTo?: string;
  createdBy?: string;
  tags?: string[];
  dueDateFrom?: Date;
  dueDateTo?: Date;
}

interface TaskStatistics {
  total: number;
  byStatus: Record<TaskStatus, number>;
  byPriority: Record<TaskPriority, number>;
  byCategory: Record<TaskCategory, number>;
  completed: number;
  overdue: number;
  completionRate: number;
}

// Clase principal de gestión de tareas
class TaskManager {
  private tasks: Map<string, Task>;
  private users: Map<string, User>;
  private idCounter: number;

  constructor() {
    this.tasks = new Map();
    this.users = new Map();
    this.idCounter = 0;
  }

  // Generador de IDs únicos
  private generateId(prefix: string): string {
    return `${prefix}_${++this.idCounter}_${Date.now()}`;
  }

  // ========================================================================
  // Gestión de Usuarios
  // ========================================================================

  createUser(name: string, email: string, role: User['role']): User {
    const user: User = {
      id: this.generateId('user'),
      name,
      email,
      role,
      createdAt: new Date()
    };
    this.users.set(user.id, user);
    return user;
  }

  getUser(userId: string): User | undefined {
    return this.users.get(userId);
  }

  getAllUsers(): User[] {
    return Array.from(this.users.values());
  }

  // ========================================================================
  // Gestión de Tareas
  // ========================================================================

  createTask(
    title: string,
    description: string,
    createdBy: string,
    options: {
      priority?: TaskPriority;
      category?: TaskCategory;
      assignedTo?: string;
      dueDate?: Date;
      tags?: string[];
    } = {}
  ): Task {
    const task: Task = {
      id: this.generateId('task'),
      title,
      description,
      priority: options.priority || TaskPriority.MEDIUM,
      status: TaskStatus.TODO,
      category: options.category || TaskCategory.WORK,
      assignedTo: options.assignedTo || null,
      createdBy,
      createdAt: new Date(),
      updatedAt: new Date(),
      dueDate: options.dueDate || null,
      tags: options.tags || [],
      subtasks: [],
      comments: [],
      attachments: []
    };

    this.tasks.set(task.id, task);
    return task;
  }

  getTask(taskId: string): Task | undefined {
    return this.tasks.get(taskId);
  }

  getAllTasks(): Task[] {
    return Array.from(this.tasks.values());
  }

  updateTask(taskId: string, updates: Partial<Task>): Task | null {
    const task = this.tasks.get(taskId);
    if (!task) return null;

    const updatedTask: Task = {
      ...task,
      ...updates,
      id: task.id,
      createdAt: task.createdAt,
      updatedAt: new Date()
    };

    this.tasks.set(taskId, updatedTask);
    return updatedTask;
  }

  deleteTask(taskId: string): boolean {
    return this.tasks.delete(taskId);
  }

  // ========================================================================
  // Gestión de Subtareas
  // ========================================================================

  addSubtask(taskId: string, title: string): Subtask | null {
    const task = this.tasks.get(taskId);
    if (!task) return null;

    const subtask: Subtask = {
      id: this.generateId('subtask'),
      title,
      completed: false,
      createdAt: new Date()
    };

    task.subtasks.push(subtask);
    task.updatedAt = new Date();
    return subtask;
  }

  toggleSubtask(taskId: string, subtaskId: string): boolean {
    const task = this.tasks.get(taskId);
    if (!task) return false;

    const subtask = task.subtasks.find(st => st.id === subtaskId);
    if (!subtask) return false;

    subtask.completed = !subtask.completed;
    task.updatedAt = new Date();
    return true;
  }

  // ========================================================================
  // Gestión de Comentarios
  // ========================================================================

  addComment(taskId: string, userId: string, content: string): Comment | null {
    const task = this.tasks.get(taskId);
    if (!task) return null;

    const comment: Comment = {
      id: this.generateId('comment'),
      userId,
      content,
      createdAt: new Date(),
      edited: false
    };

    task.comments.push(comment);
    task.updatedAt = new Date();
    return comment;
  }

  // ========================================================================
  // Filtrado y Búsqueda
  // ========================================================================

  filterTasks(filter: TaskFilter): Task[] {
    let filtered = this.getAllTasks();

    if (filter.status && filter.status.length > 0) {
      filtered = filtered.filter(t => filter.status!.includes(t.status));
    }

    if (filter.priority && filter.priority.length > 0) {
      filtered = filtered.filter(t => filter.priority!.includes(t.priority));
    }

    if (filter.category && filter.category.length > 0) {
      filtered = filtered.filter(t => filter.category!.includes(t.category));
    }

    if (filter.assignedTo) {
      filtered = filtered.filter(t => t.assignedTo === filter.assignedTo);
    }

    if (filter.createdBy) {
      filtered = filtered.filter(t => t.createdBy === filter.createdBy);
    }

    if (filter.tags && filter.tags.length > 0) {
      filtered = filtered.filter(t =>
        filter.tags!.some(tag => t.tags.includes(tag))
      );
    }

    if (filter.dueDateFrom) {
      filtered = filtered.filter(
        t => t.dueDate && t.dueDate >= filter.dueDateFrom!
      );
    }

    if (filter.dueDateTo) {
      filtered = filtered.filter(
        t => t.dueDate && t.dueDate <= filter.dueDateTo!
      );
    }

    return filtered;
  }

  searchTasks(query: string): Task[] {
    const lowerQuery = query.toLowerCase();
    return this.getAllTasks().filter(
      task =>
        task.title.toLowerCase().includes(lowerQuery) ||
        task.description.toLowerCase().includes(lowerQuery) ||
        task.tags.some(tag => tag.toLowerCase().includes(lowerQuery))
    );
  }

  // ========================================================================
  // Estadísticas y Reportes
  // ========================================================================

  getStatistics(): TaskStatistics {
    const tasks = this.getAllTasks();
    const now = new Date();

    const byStatus = tasks.reduce((acc, task) => {
      acc[task.status] = (acc[task.status] || 0) + 1;
      return acc;
    }, {} as Record<TaskStatus, number>);

    const byPriority = tasks.reduce((acc, task) => {
      acc[task.priority] = (acc[task.priority] || 0) + 1;
      return acc;
    }, {} as Record<TaskPriority, number>);

    const byCategory = tasks.reduce((acc, task) => {
      acc[task.category] = (acc[task.category] || 0) + 1;
      return acc;
    }, {} as Record<TaskCategory, number>);

    const completed = byStatus[TaskStatus.COMPLETED] || 0;
    const overdue = tasks.filter(
      t => t.dueDate && t.dueDate < now && t.status !== TaskStatus.COMPLETED
    ).length;

    const completionRate = tasks.length > 0 ? (completed / tasks.length) * 100 : 0;

    return {
      total: tasks.length,
      byStatus,
      byPriority,
      byCategory,
      completed,
      overdue,
      completionRate
    };
  }

  getOverdueTasks(): Task[] {
    const now = new Date();
    return this.getAllTasks().filter(
      task =>
        task.dueDate &&
        task.dueDate < now &&
        task.status !== TaskStatus.COMPLETED &&
        task.status !== TaskStatus.CANCELLED
    );
  }

  getUpcomingTasks(days: number = 7): Task[] {
    const now = new Date();
    const futureDate = new Date(now.getTime() + days * 24 * 60 * 60 * 1000);

    return this.getAllTasks().filter(
      task =>
        task.dueDate &&
        task.dueDate >= now &&
        task.dueDate <= futureDate &&
        task.status !== TaskStatus.COMPLETED
    );
  }

  // ========================================================================
  // Utilidades
  // ========================================================================

  sortTasks(
    tasks: Task[],
    sortBy: 'priority' | 'dueDate' | 'createdAt' | 'title',
    order: 'asc' | 'desc' = 'asc'
  ): Task[] {
    const sorted = [...tasks].sort((a, b) => {
      let comparison = 0;

      switch (sortBy) {
        case 'priority':
          const priorityOrder = {
            [TaskPriority.URGENT]: 4,
            [TaskPriority.HIGH]: 3,
            [TaskPriority.MEDIUM]: 2,
            [TaskPriority.LOW]: 1
          };
          comparison = priorityOrder[a.priority] - priorityOrder[b.priority];
          break;

        case 'dueDate':
          if (!a.dueDate && !b.dueDate) comparison = 0;
          else if (!a.dueDate) comparison = 1;
          else if (!b.dueDate) comparison = -1;
          else comparison = a.dueDate.getTime() - b.dueDate.getTime();
          break;

        case 'createdAt':
          comparison = a.createdAt.getTime() - b.createdAt.getTime();
          break;

        case 'title':
          comparison = a.title.localeCompare(b.title);
          break;
      }

      return order === 'asc' ? comparison : -comparison;
    });

    return sorted;
  }

  exportToJSON(): string {
    return JSON.stringify(
      {
        tasks: Array.from(this.tasks.values()),
        users: Array.from(this.users.values())
      },
      null,
      2
    );
  }
}

// ============================================================================
// Ejemplo de uso
// ============================================================================

const manager = new TaskManager();

// Crear usuarios
const admin = manager.createUser('Ana García', 'ana@example.com', 'admin');
const user1 = manager.createUser('Carlos López', 'carlos@example.com', 'user');
const user2 = manager.createUser('María Rodríguez', 'maria@example.com', 'user');

const epic = (a: number) => "asda" + a.toString();
epic(4);

// Crear tareas
const task1 = manager.createTask(
  'Implementar autenticación',
  'Agregar sistema de login con JWT',
  admin.id,
  {
    priority: TaskPriority.HIGH,
    category: TaskCategory.WORK,
    assignedTo: user1.id,
    dueDate: new Date('2026-02-15'),
    tags: ['backend', 'security', 'urgent']
  }
);

const task2 = manager.createTask(
  'Diseñar interfaz de usuario',
  'Crear mockups para la nueva funcionalidad',
  admin.id,
  {
    priority: TaskPriority.MEDIUM,
    category: TaskCategory.WORK,
    assignedTo: user2.id,
    dueDate: new Date('2026-02-10'),
    tags: ['frontend', 'design']
  }
);

// Agregar subtareas
manager.addSubtask(task1.id, 'Configurar JWT library');
manager.addSubtask(task1.id, 'Crear endpoints de login/logout');
manager.addSubtask(task1.id, 'Implementar refresh tokens')

// Agregar comentarios
manager.addComment(task1.id, user1.id, 'Empezando con la configuración inicial');
manager.addComment(task1.id, admin.id, 'Recuerda usar bcrypt para las contraseñas');

// Actualizar estado
manager.updateTask(task1.id, { status: TaskStatus.IN_PROGRESS });

// Obtener estadísticas
const stats = manager.getStatistics();
console.log('Estadísticas:', stats);

// Filtrar tareas
const highPriorityTasks = manager.filterTasks({
  priority: [TaskPriority.HIGH, TaskPriority.URGENT]
});

console.log('Tareas de alta prioridad:', highPriorityTasks.length);

export { TaskManager, TaskPriority, TaskStatus, TaskCategory };
export type { Task, User, TaskFilter, TaskStatistics };
