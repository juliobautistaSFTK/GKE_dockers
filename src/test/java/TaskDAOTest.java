import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;

import java.sql.SQLException;
import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.softtek.dao.TaskDAO;
import com.softtek.model.Task;

public class TaskDAOTest {
    private TaskDAO taskDAO;

    @BeforeEach
    void setup() {
        taskDAO = new TaskDAO();
    }

    @Test
    void testAgregarTarea() throws SQLException {
        Task tarea = new Task("Nueva", "Descripción", LocalDate.now(), LocalDate.now().plusDays(1), "Pendiente");
        taskDAO.agregarTarea(tarea);
        assertNotNull(taskDAO.obtenerTareaPorTitulo("Nueva"));
    }
    
    @Test
    void testEditarTarea() throws SQLException {
        Task tarea = new Task("Nueva", "Descripción", LocalDate.now(), LocalDate.now().plusDays(1), "Pendiente");
        taskDAO.agregarTarea(tarea);
        Task tareaEditar = taskDAO.obtenerTareaPorTitulo("Nueva");
        tareaEditar.setTitulo("Modificada");
        taskDAO.editarTarea(tareaEditar);
        assertNotNull(taskDAO.obtenerTareaPorTitulo("Modificada"));
    }
    
    @Test
    void testEliminarTarea() throws SQLException {
        Task tarea = new Task("Eliminar", "Descripción", LocalDate.now(), LocalDate.now().plusDays(1), "Pendiente");
        taskDAO.agregarTarea(tarea);
        Task tareaEditar = taskDAO.obtenerTareaPorTitulo("Eliminar");
        taskDAO.eliminarTarea(tareaEditar.getId());
        assertNull(taskDAO.obtenerTareaPorTitulo("Eliminar"));
    }
    
    @Test
    void testObtenerTareas() throws SQLException {
        assertNotNull(taskDAO.obtenerTareas());
    }
}
