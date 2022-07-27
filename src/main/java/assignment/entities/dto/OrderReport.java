package assignment.entities.dto;

import assignment.entities.Orders;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderReport {

	private Orders order;
	
	private long quantity;
	
	private double total;
	
}
