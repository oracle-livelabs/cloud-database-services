        package example.basedb.controller;

        import example.basedb.domain.Thing;
        import example.basedb.repository.ThingRepository;
        import io.micronaut.http.annotation.Controller;
        import io.micronaut.http.annotation.Get;
        import io.micronaut.scheduling.TaskExecutors;
        import io.micronaut.scheduling.annotation.ExecuteOn;

        import javax.validation.constraints.NotBlank;
        import java.util.List;
        import java.util.Optional;

        @Controller("/things")
        @ExecuteOn(TaskExecutors.IO)
        class ThingController {

        private final ThingRepository thingRepository;

        ThingController(ThingRepository thingRepository) {
         this.thingRepository = thingRepository;
        }

        @Get
        List<Thing> all() {
         return thingRepository.findAll();
        }

        @Get("/{name}")
        Optional<Thing> byName(@NotBlank String name) {
         return thingRepository.findByName(name);
        }
        }
