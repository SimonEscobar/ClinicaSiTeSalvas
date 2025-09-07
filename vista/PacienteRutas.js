// routes/medicoRoutes.js
const express = require('express');
const router = express.Router();
const PacienteControlador = require('../controlador/PacienteControlador');

// Rutas disponibles:
// GET     /pacientes          -> listar todos los  paciente
// GET     /pacientes/:id      -> obtener un paciente por ID
// POST    /pacientes          -> crear un nuevo paciente
// PUT     /pacientes/:id      -> actualizar un paciente
// DELETE  /pacientes/:id      -> eliminar un paciente

router.get('/', PacienteControlador.listar);
router.get('/:id', PacienteControlador.obtenerPorId);
router.post('/', PacienteControlador.crear);
router.put('/:id', PacienteControlador.actualizar);
router.delete('/:id', PacienteControlador.eliminar);

module.exports = router;