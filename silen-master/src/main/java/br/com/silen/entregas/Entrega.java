package br.com.silen.entregas;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import br.com.silen.caixa.Caixa;
import br.com.silen.clientes.Client;
import br.com.silen.motoboy.Motoboy;

@Entity
@Table(name = "entrega")
public class Entrega {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	@OneToOne
	@JoinColumn(name = "cliente_id")
	private Client cliente;

	@OneToOne
	@JoinColumn(name = "motoboy_id")
	private Motoboy motoboy;

	@OneToOne
	@JoinColumn(name = "caixa_id")
	private Caixa caixa;

	@Column(name = "started_at")
	private Calendar startedAt;

	@Column(name = "finished_at")
	private Calendar finishedAt;
	
	@Column(name = "status")
	@Enumerated(EnumType.STRING)
	private EntregaStatus status;

	@Column(name = "quantidade_caixa")
	private long quantidadeCaixa;

	@Deprecated //Hibernate eyes only
	Entrega() {}

	public Entrega(Client cliente, Motoboy motoboy, Caixa caixa, Integer quantidadeCaixa) {
		this.cliente = cliente;
		this.motoboy = motoboy;
		this.caixa = caixa;
		this.quantidadeCaixa = quantidadeCaixa;
		this.status = EntregaStatus.ABERTA;
	}

	public long getId() {
		return id;
	}

	public Client getCliente() {
		return cliente;
	}

	public Motoboy getMotoboy() {
		return motoboy;
	}

	public Caixa getCaixa() {
		return caixa;
	}
	
	public long getQuantidadeCaixa() {
		return quantidadeCaixa;
	}

	public void setCliente(Client cliente) {
		this.cliente = cliente;
	}

	public void setMotoboy(Motoboy motoboy) {
		this.motoboy = motoboy;
	}

	public void setCaixa(Caixa caixa) {
		this.caixa = caixa;
	}

	public void setQuantidadeCaixa(long quantidadeCaixa) {
		this.quantidadeCaixa = quantidadeCaixa;
	}
	
	public EntregaStatus getStatus() {
		return status;
	}
	
	public void setStatus(EntregaStatus status) {
		this.status = status;
	}

	public String getStartedAt() {
		if(startedAt == null) {
			return "";
		}
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		return format.format(startedAt.getTime());
	}
	
	public String getFinishedAt() {
		if(finishedAt == null) {
			return "";
		}
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		return format.format(finishedAt.getTime());
	}
	
	public void setFinishedAt(Calendar finishedAt) {
		this.finishedAt = finishedAt;
	}
	
	public void setStartedAt(Calendar startedAt) {
		this.startedAt = startedAt;
	}
	
	public void markAsStarted() {
		this.startedAt = Calendar.getInstance();
		this.status = EntregaStatus.INICIADA;
	}

	public void markAsFinished() {
		this.finishedAt = Calendar.getInstance();
		this.status = EntregaStatus.FINALIZADA;
	}
	
	public double getLatitude() {
		return cliente.getLatitude();
	}
	
	public double getLongitude() {
		return cliente.getLongitude();
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE);
	}

}