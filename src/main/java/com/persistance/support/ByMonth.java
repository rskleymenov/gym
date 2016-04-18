package com.persistance.support;

public class ByMonth {
	private Double expense;
	private String paymentMonth;

	public ByMonth() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ByMonth(Double expense, String paymentMonth) {
		super();
		this.expense = expense;
		this.paymentMonth = paymentMonth;
	}

	public Double getExpense() {
		return expense;
	}

	public void setExpense(Double expense) {
		this.expense = expense;
	}

	public String getPaymentMonth() {
		return paymentMonth;
	}

	public void setPaymentMonth(String paymentMonth) {
		this.paymentMonth = paymentMonth;
	}

	@Override
	public String toString() {
		return "ByMonth [expense=" + expense + ", paymentMonth=" + paymentMonth + "]";
	}

}
