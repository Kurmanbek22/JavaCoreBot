package peaksoft.javacorebot.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import peaksoft.javacorebot.entities.SubTopic;
import peaksoft.javacorebot.repository.SubtopicRepository;

import java.util.List;
import java.util.Optional;

@Service
public class SubTopicService {
    private final SubtopicRepository subtopicRepository;

    public SubTopicService(SubtopicRepository subtopicRepository) {
        this.subtopicRepository = subtopicRepository;
    }

    public List<SubTopic> getSubtopicsByTopicId(Long topicId) {
        return subtopicRepository.findAllByTopicId(topicId);
    }

    public Optional<SubTopic> getSubtopicById(Long id) {
        return subtopicRepository.findById(id);
    }
}
