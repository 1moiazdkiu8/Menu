package models;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "menus")
@NamedQueries({
        @NamedQuery(name = "getAllMenus", query = "SELECT m FROM Menu AS m ORDER BY m.id DESC"),
        @NamedQuery(name = "getMenusCount", query = "SELECT COUNT(m) FROM Menu AS m"),
        @NamedQuery(name = "getMyAllMenus", query = "SELECT m FROM Menu AS m WHERE m.user = :user ORDER BY m.id DESC"),
        @NamedQuery(name = "getMyMenusCount", query = "SELECT COUNT(m) FROM Menu AS m WHERE m.user = :user"),
        @NamedQuery(name = "allSearchMenus", query = "SELECT m FROM Menu AS m WHERE m.mood LIKE :mood"),
        @NamedQuery(name = "allSearchMenusCount", query = "SELECT COUNT(m) FROM Menu AS m WHERE m.mood LIKE :mood"),
        @NamedQuery(name = "searchMenus", query = "SELECT m FROM Menu AS m WHERE m.mood LIKE :mood AND m.user = :user"),
        @NamedQuery(name = "searchMenusCount", query = "SELECT COUNT(m) FROM Menu AS m WHERE m.mood LIKE :mood AND m.user = :user")

})
public class Menu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "menu_date", nullable = false)
    private Date menu_date;

    @Column(name = "menu_name", length = 255, nullable = false)
    private String menu_name;

    @Lob
    @Column(name = "content")
    private String content;

    @Column(name = "created_at", nullable = false)
    private Timestamp created_at;

    @Column(name = "updated_at", nullable = false)
    private Timestamp updated_at;

    @Column(name = "mood")
    private String mood;

    @Column(name = "ingredient")
    private String ingredient;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getMenu_date() {
        return menu_date;
    }

    public void setMenu_date(Date menu_date) {
        this.menu_date = menu_date;
    }

    public String getMenu_name() {
        return menu_name;
    }

    public void setMenu_name(String menu_name) {
        this.menu_name = menu_name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }

    public String getMood() {
        return mood;
    }

    public void setMood(String mood) {
        this.mood = mood;
    }

    public String getIngredient() {
        return ingredient;
    }

    public void setIngredient(String ingredient) {
        this.ingredient = ingredient;
    }

}