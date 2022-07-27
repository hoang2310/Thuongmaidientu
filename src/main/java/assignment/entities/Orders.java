package assignment.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
@Entity
@Table(name = "orders")
public class Orders {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@NotNull
	@ManyToOne
	@JoinColumn(name = "user_id")
	private Accounts account;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "create_date")
	private Date createDate;

	@NotBlank
	@Column(name = "address")
	private String address;

	@OneToMany(mappedBy = "order", cascade = { CascadeType.PERSIST, CascadeType.REMOVE}) 
	private List<OrderDetails> orderDetails;
	
}
