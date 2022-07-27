// Generated with g9.

package assignment.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
@Entity
@Table(name = "accounts")
public class Accounts {

	@NotNull
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "username")
	@NotBlank(message = "Không được để trống")
	private String username;

	@Column(name = "password")
	@NotBlank(message = "Không được để trống")
	@Size(min=6)
	private String password;

	@Column(name = "fullname")
	@NotBlank(message = "Không được để trống")
	private String fullname;

	@Column(name = "email")
	@NotBlank(message = "Không được để trống")
	@Pattern(regexp="^\\w+\\@fpt.edu.vn")
	private String email;

	
	@Column(name = "photo")
	private String photo;

	@NotNull
	@Column(name = "activated")
	private int activated;
	
	@NotNull
	@Column(name = "admin")
	private int admin;
	
}
