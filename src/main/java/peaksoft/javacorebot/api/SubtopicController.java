package peaksoft.javacorebot.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import peaksoft.javacorebot.entities.SubTopic;
import peaksoft.javacorebot.service.SubTopicService;

import java.util.List;

@RestController
@RequestMapping("/api/subtopics")
public class SubtopicController {
    private final SubTopicService subtopicService;

    @Autowired
    public SubtopicController(SubTopicService subtopicService) {
        this.subtopicService = subtopicService;
    }

    @GetMapping("/topic/{topicId}")
    public List<SubTopic> getSubtopicsByTopic(@PathVariable Long topicId) {
        return subtopicService.getSubtopicsByTopicId(topicId);
    }

    @GetMapping("/{id}")
    public ResponseEntity<SubTopic> getSubtopic(@PathVariable Long id) {
        return subtopicService.getSubtopicById(id)
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }
}
