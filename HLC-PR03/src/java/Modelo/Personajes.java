/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author z3rh10
 */
@Entity
@Table(name = "PERSONAJES")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Personajes.findAll", query = "SELECT p FROM Personajes p")
    , @NamedQuery(name = "Personajes.findByIdp", query = "SELECT p FROM Personajes p WHERE p.idp = :idp")
    , @NamedQuery(name = "Personajes.findByNombrep", query = "SELECT p FROM Personajes p WHERE p.nombrep = :nombrep")
    , @NamedQuery(name = "Personajes.findByCostep", query = "SELECT p FROM Personajes p WHERE p.costep = :costep")
    , @NamedQuery(name = "Personajes.findByRol", query = "SELECT p FROM Personajes p WHERE p.rol = :rol")
    , @NamedQuery(name = "Personajes.findByLanzamientop", query = "SELECT p FROM Personajes p WHERE p.lanzamientop = :lanzamientop")})
public class Personajes implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IDP")
    private Integer idp;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "NOMBREP")
    private String nombrep;
    @Basic(optional = false)
    @NotNull
    @Column(name = "COSTEP")
    private int costep;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 4)
    @Column(name = "ROL")
    private String rol;
    @Basic(optional = false)
    @NotNull
    @Column(name = "LANZAMIENTOP")
    @Temporal(TemporalType.DATE)
    private Date lanzamientop;

    public Personajes() {
    }

    public Personajes(Integer idp) {
        this.idp = idp;
    }

    public Personajes(Integer idp, String nombrep, int costep, String rol, Date lanzamientop) {
        this.idp = idp;
        this.nombrep = nombrep;
        this.costep = costep;
        this.rol = rol;
        this.lanzamientop = lanzamientop;
    }

    public Integer getIdp() {
        return idp;
    }

    public void setIdp(Integer idp) {
        this.idp = idp;
    }

    public String getNombrep() {
        return nombrep;
    }

    public void setNombrep(String nombrep) {
        this.nombrep = nombrep;
    }

    public int getCostep() {
        return costep;
    }

    public void setCostep(int costep) {
        this.costep = costep;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public Date getLanzamientop() {
        return lanzamientop;
    }

    public void setLanzamientop(Date lanzamientop) {
        this.lanzamientop = lanzamientop;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idp != null ? idp.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Personajes)) {
            return false;
        }
        Personajes other = (Personajes) object;
        if ((this.idp == null && other.idp != null) || (this.idp != null && !this.idp.equals(other.idp))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Controlador.Personajes[ idp=" + idp + " ]";
    }
    
}
