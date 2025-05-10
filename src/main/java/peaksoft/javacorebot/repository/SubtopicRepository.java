package peaksoft.javacorebot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import peaksoft.javacorebot.entities.SubTopic;

import java.util.List;

public interface SubtopicRepository extends JpaRepository<SubTopic,Long> {
    List<SubTopic> findAllByTopicId(Long topicId);

}
