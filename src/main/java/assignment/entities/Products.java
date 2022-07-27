package assignment.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
@Entity
@Table(name = "products")
public class Products {

	@NotNull
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@NotBlank
	@Column(name = "name")
	private String name;

	@NotBlank
	@Column(name = "image")
	private String image;

	@Min(value = 0)
	@NotNull
	@Column(name = "price")
	private int price;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "created_date")
	private Date createdDate;

	@Min(value = 0)
	@NotNull
	@Column(name = "available")
	private int available;

	@NotNull
	@ManyToOne
	@JoinColumn(name = "category_id")
	private Categories category;

}
