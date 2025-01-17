package com.movie.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="movie")
public class Movie {
	@Id
	private String movId;
	private String movieName;
	private String category;
	private int tickno;
	private double price;
	private String image;
	private String actor;
	private String actress;
	private String director;

	
	public String getMovId() {
		return movId;
	}
	public void setMovId(String movId) {
		this.movId = movId;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getTickno() {
		return tickno;
	}
	public void setTickno(int tickno) {
		this.tickno = tickno;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getActress() {
		return actress;
	}
	public void setActress(String actress) {
		this.actress = actress;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}


	
}
