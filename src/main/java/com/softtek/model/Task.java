package com.softtek.model;

import java.time.LocalDate;

public class Task {

	public Task() {
		super();
	}
	
	public Task(String titulo, String descripcion, LocalDate fechaCreacion, LocalDate fechaVencimiento,
			String estado) {
		super();
		this.titulo = titulo;
		this.descripcion = descripcion;
		this.fechaCreacion = fechaCreacion;
		this.fechaVencimiento = fechaVencimiento;
		this.estado = estado;
	}

	private int id;
	private String titulo;
	private String descripcion;
	private LocalDate fechaCreacion;
	private LocalDate fechaVencimiento;
	private String estado;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public LocalDate getFechaCreacion() {
		return fechaCreacion;
	}

	public void setFechaCreacion(LocalDate localDate) {
		this.fechaCreacion = localDate;
	}

	public LocalDate getFechaVencimiento() {
		return fechaVencimiento;
	}

	public void setFechaVencimiento(LocalDate fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

}
