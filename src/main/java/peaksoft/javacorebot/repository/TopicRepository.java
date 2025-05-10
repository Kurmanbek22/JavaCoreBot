package peaksoft.javacorebot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import peaksoft.javacorebot.entities.Topic;

public interface TopicRepository extends JpaRepository<Topic, Long> {
}
