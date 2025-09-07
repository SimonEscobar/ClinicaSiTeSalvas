// controllers/PacienteControlador.js
const Paciente = require('../modelo/PacienteModelo');

const PacienteControlador = {
    // GET /pacientes
    async listar(req, res) {
        try {
            const pacientes = await Paciente.getAll();
            res.status(200).json(pacientes);
        } catch (error) {
            console.error('Error al listar pacientes:', error);
            res.status(500).json({ mensaje: 'Error al obtener los pacientes' });
        }
    },

    // GET /pacientes/:id
    async obtenerPorId(req, res) {
        const { id } = req.params;
        try {
            const paciente = await Paciente.getById(id);
            if (!paciente) {
                return res.status(404).json({ mensaje: 'Paciente no encontrado' });
            }
            res.status(200).json(paciente);
        } catch (error) {
            console.error('Error al obtener paciente por ID:', error);
            res.status(500).json({ mensaje: 'Error al obtener el paciente' });
        }
    },

    // POST /pacientes
    async crear(req, res) {
        const { t1: documento, t2: nombre, t3: telefono, t4: correo, t5: direccion } = req.body;
        if (!documento || !nombre || !telefono || !correo || !direccion) {
            return res.status(400).json({ mensaje: 'Todos los campos son obligatorios' });
        }

        try {
            const nuevoPaciente = new Paciente(documento, nombre, telefono, correo, direccion);
            const pacienteGuardado = await nuevoPaciente.save();
            res.status(201).json(pacienteGuardado);
        } catch (error) {
            console.error('Error al crear paciente:', error);
            res.status(500).json({ mensaje: 'Error al crear el paciente' });
        }
    },

    // PUT /pacientes/:id
    async actualizar(req, res) {
        const { id } = req.params;
        const { t1: documento, t2: nombre, t3: telefono, t4: correo, t5: direccion } = req.body;
        const datos = new Paciente(documento,nombre, telefono, correo, direccion);

        if (Object.keys(datos).length === 0) {
            return res.status(400).json({ mensaje: 'No hay datos para actualizar' });
        }

        try {
            const pacienteExistente = await Paciente.getById(id);
            if (!pacienteExistente) {
                return res.status(404).json({ mensaje: 'Paciente no encontrado' });
            }

            const pacienteActualizado = await Paciente.update(id, datos);
            res.status(200).json(pacienteActualizado);
        } catch (error) {
            console.error('Error al actualizar paciente:', error);
            res.status(500).json({ mensaje: 'Error al actualizar el paciente' });
        }
    },

    // DELETE /pacientes/:id
    async eliminar(req, res) {
        const { id } = req.params;
        try {
            const eliminado = await Paciente.delete(id);
            if (!eliminado) {
                return res.status(404).json({ mensaje: 'Paciente no encontrado' });
            }
            res.status(200).json({ mensaje: 'Paciente eliminado correctamente' });
        } catch (error) {
            console.error('Error al eliminar paciente:', error);
            res.status(500).json({ mensaje: 'Error al eliminar el paciente' });
        }
    }
};

module.exports = PacienteControlador;