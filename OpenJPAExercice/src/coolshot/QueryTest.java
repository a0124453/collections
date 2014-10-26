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
import java.util.List;
import java.util.Iterator;

public class QueryTest {    
    
	public static void main(String[] args) {

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("CoolShotPU");		
		EntityManager em = emf.createEntityManager();
        MovieService movieService = new MovieService(em);
        
        // count all reviews for each movie
        System.out.println("Review count: ");

        // use movie service directly
        Collection<Movie> movies = movieService.findAllMovies();
        for (Movie m : movies) {
            System.out.println(m.getTitle() + ": " + m.getReviews().size());
        }

        // jpql statement
        Query q = em.createQuery("SELECT m.title, COUNT(r) FROM Movie m INNER JOIN Review r GROUP BY m.title");
        List<Object[]> resultList = q.getResultList();
        for (int i=0;i<resultList.size();i++){
            System.out.println(resultList.get(i)[0] + ": " + resultList.get(i)[1]);
        }
        System.out.println();
        
        
        // find all movies that has at least 3 reviews
        System.out.println("Movie with at least 3 reviews: ");
        // movie service
        Collection<Movie> allMovies = movieService.findAllMovies();
        for (Movie m : allMovies) {
            if (m.getReviews().size() >= 3) {
                System.out.println(m.toString() + "\t" + m.getReviews().size());
            }
        }

        // jpql -- not working
        Query query = em.createQuery("SELECT r.movie.title, COUNT(r) FROM Review r GROUP BY r.movie.title HAVING COUNT(r) > 2 ");
        List<Object[]> result2List = query.getResultList();
        for (int i=0;i<result2List.size();i++){
            System.out.println(result2List.get(i)[0] + ": " + result2List.get(i)[1]);
        }
        System.out.println();
        
		em.close();
		emf.close();
	}
}
