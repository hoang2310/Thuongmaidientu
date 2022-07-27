package assignment.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import assignment.entities.Accounts;
import assignment.entities.Orders;
import assignment.entities.dto.OrderReport;
import ch.qos.logback.core.status.Status;

@Repository
public interface OrderRepository extends JpaRepository<Orders, Integer>{
	@Query(value = "SELECT new assignment.entities.dto.OrderReport(o, SUM(od.quantity), SUM(od.quantity*od.price)) FROM Orders o JOIN o.orderDetails od GROUP BY o")
	Page<OrderReport> findAllOrderReport(Pageable pageable);

	@Query(value = "SELECT o FROM Orders o WHERE o.account.id = account")
	List<Orders> findAllOrderByAccount(Accounts account);
}
