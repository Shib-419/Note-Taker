package com.todo.entities;

import java.util.Date;
import java.util.Random;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@Data
public class NoteTaker {
	public NoteTaker(String title, String content, Date addedDate) {
		super();
		this.id = new Random().nextInt(100000);  // Generates an Random id between this range..
		this.title = title;
		this.content = content;
		this.addedDate = addedDate;
	}
	@Id
	private int id;
	private String title;
	@Column(length = 2000)
	private String content;
	private Date addedDate;
}
