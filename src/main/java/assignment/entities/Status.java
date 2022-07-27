package assignment.entities;

public enum Status {

	PENDING(1, "Đang Chờ Xác Nhận"), CONFIRMMED(2, "Đã Xác Nhận"), CANCELLED(3, "Đã Hủy"),
	SHIPPING(4, "Đang Giao Hàng"), SHIPPED(5, "Đã Nhận Hàng");

	private final int id;
	private final String value;

	private Status(int id, String value) {
		this.id = id;
		this.value = value;
	}

	public int getId() {
		return id;
	}

	public String getValue() {
		return value;
	}

}
