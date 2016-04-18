package com.persistance.support;

public class ByYear {
	private Double expense;
	private int paymentYear;

	public ByYear() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ByYear(Double expense, int paymentYear) {
		super();
		this.expense = expense;
		this.paymentYear = paymentYear;
	}

	public Double getExpense() {
		return expense;
	}

	public void setExpense(Double expense) {
		this.expense = expense;
	}

	public int getPaymentYear() {
		return paymentYear;
	}

	public void setPaymentYear(int paymentYear) {
		this.paymentYear = paymentYear;
	}

	@Override
	public String toString() {
		return "ByYear [expense=" + expense + ", paymentYear=" + paymentYear + "]";
	}

}
