/**
 * Name   1 : Gu Junchao
 * Matric 1 : A0105750N
 *
 * Name   2 : 
 * Matric 2 :
 */

package coolshot;

import javax.persistence.*;
import java.util.Collection;
import java.util.Date;

public class ReviewService {
    protected EntityManager em;

    public ReviewService(EntityManager em) {
        this.em = em;
    }

    public Review createReview(int id, int score, String comment, Movie mov) {
        Review rev = new Review(id);
        rev.setScore(score);
        rev.setComment(comment);
        rev.setMovie(mov);
        rev.setReviewedDate(new Date());
        em.persist(rev);
        return rev;
    }

    public Review removeReview(int id) {
        Review rev = findReview(id);
        if (rev != null) {
            em.remove(rev);
        }
        return rev;
    }

    public Review findReview(int id) {
        Review rev = em.find(Review.class, id);
        return rev;
    }

    public Collection<Review> findAllReviews() {
        Query q = em.createQuery("SELECT r FROM Review r");
        return (Collection<Review>)q.getResultList();
    }
    
    public Collection<Review> findAllReviews(Movie mov) {
        int movieId = mov.getId();
        Query q = em.createQuery("SELECT r FROM Review r WHERE r.movie.id = :movieId").setParameter("movieId", movieId);
        return (Collection<Review>)q.getResultList();
    }
    
    public Collection<Review> findReviewsByTitle(String title) {
        Query q = em.createQuery("SELECT r FROM Review r WHERE r.movie.title = :movieTitle").setParameter("movieTitle", title);
        // this is unsafe
        //String queryString = "SELECT r FROM Review r WHERE r.movie.title = '" + title + "'";
        //Query q = em.createQuery(queryString);
        return (Collection<Review>)q.getResultList();
    }
}
