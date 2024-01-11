package ru.netology.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ru.netology.component.FileInfo;
import ru.netology.component.NewFileName;
import ru.netology.exception.InvalidDataException;
import ru.netology.service.FileService;

import java.util.List;

@Controller
//@RequestMapping("/file")
@RequiredArgsConstructor
public class FileController {
    private final FileService fileService;

    @PostMapping("/file")
    public ResponseEntity<String> upload(@RequestParam(name = "filename") String fileName, @RequestBody MultipartFile fileBody) {
        fileService.upload(fileName, fileBody);
        return ResponseEntity.ok("");
    }

    @DeleteMapping("/file")
    public ResponseEntity<String> delete(@RequestParam(name = "filename") String fileName) {
        fileService.delete(fileName);
        return ResponseEntity.ok("");
    }

    @PutMapping("/file")
    public ResponseEntity<String> change(@RequestParam(name = "filename") String fileName, @RequestBody NewFileName newNameRequest) {
        if (newNameRequest.getName() == null) {
            throw new InvalidDataException("Некорректное тело запроса");
        }
        fileService.change(fileName, newNameRequest.getName());
        return ResponseEntity.ok("");
    }

    @GetMapping("/file")
    public ResponseEntity<Resource> downloadFile(@RequestParam(name = "filename") String filename) {
        Resource resource = fileService.load(filename);
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
                .body(resource);
    }

    @GetMapping("/list")
    public ResponseEntity<List<FileInfo>> getFiles(@RequestParam(name = "limit") Integer limit) {
        return ResponseEntity.ok(fileService.getList(limit));
    }
}
