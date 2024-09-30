<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>JDoodle Code Runner with CORS Proxy</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande",
            "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            min-height: 100vh;
        }

        .flex {
            display: flex;
        }

        .aic {
            align-items: center;
        }

        .jcc {
            justify-content: center;
        }

        .jcsb {
            justify-content: space-between;
        }

        .jcfs {
            justify-content: flex-start;
        }

        .aifs {
            align-items: flex-start;
        }

        .problem-info-section,
        .compiler-section {
            overflow-y: scroll;
            width: 50%;
            height: 100vh;
            padding: 50px;
            margin-top: 20px;
        }

        .problem-info-section .problem-desc {
            margin: 20px 0;
            text-align: justify;
        }

        .problem-info-section .problem-input,
        .problem-info-section .problem-output {
            padding: 12px;
            background: #b0f8ff;
            border-radius: 5px;
            width: 50%;
        }

        .problem-info-section pre {
            margin: 12px 0 18px;
        }

        .problem-info-section .constraints {
            list-style-position: inside;
            margin-top: 16px;
        }

        .problem-info-section .constraints li {
            font-size: 14px;
            margin: 5px 0;
        }

        .problem-info-section .input-format-section p {
            padding: 12px 0 18px;
        }

        .problem-info-section .problem-end-section {
            margin-top: 30px;
            font-size: 14px;
        }

        .compiler-section h2 {
            font-size: 32px;
            margin-bottom: 20px;
        }

        .compiler-section select {
            padding: 6px;
            outline: none;
            border: 1px solid #06bbcc;
            background: #b0f8ff;
            cursor: pointer;
            border-radius: 5px;
        }

        .compiler-section textarea {
            padding: 12px;
            font-size: 16px;
            outline: none;
            font-family: "Courier New", Courier, monospace;
            font-weight: 600;
            resize: none;
            margin-bottom: 20px;
            border: 2px solid #06bbcc;
            border-radius: 5px;
        }

        .compiler-section button {
            background: #06bbcc;
            border: none;
            color: #ffffff;
            padding: 10px 12px;
            border-radius: 3px;
            cursor: pointer;
            transition: 0.2s linear all;
            margin-bottom: 36px;
        }

        .compiler-section button:hover {
            background: #006b75;
        }

        .compiler-section pre {
            margin-top: 12px;
            background: #b0f8ff;
            padding: 16px;
            font-size: 16px;
            border-radius: 5px;
            color: #373737;
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<section class="coding-section | flex">
    <div class="problem-info-section">
        <div class="problem">
            <h3 class="title">${challenge.challengeId}. ${challenge.challengeTitle}</h3>
            <c:if test="${!empty status}">
                <span style="color: lime; font-size: 12px; margin: 7px 0;">${status}</span>
            </c:if>
            <p class="problem-desc">${challenge.challengeDescription}</p>
        </div>
        <div class="input-format-section">
            <span><strong>Input Format</strong></span>
            <p>${challenge.inputFormat}</p>
        </div>
        <div class="input-output-section">
            <span><strong>Sample Input</strong></span>
            <pre class="problem-input">${challenge.sampleInput}</pre
            >
            <span><strong>Sample Output</strong></span>
            <pre class="problem-output">${challenge.sampleOutput}</pre>
        </div>
        <div class="constraints-sections">
            <span><strong>Constraints </strong></span>
            <ul class="constraints">
                <c:forEach var="constraint" items="${challenge.constraints}">
                    <li><c:out value="${constraint}"/></li>
                </c:forEach>
            </ul>
        </div>
        <div class="problem-end-section">
          <span
          ><strong>Difficulty:</strong>
            <span style="background: #b0f8ff; padding: 5px; border-radius: 3px"
            >${challenge.difficultyLevel}</span
            ></span
          ><br/><br/>
            <span
            ><strong>Topics:</strong>
            <span style="background: #b0f8ff; padding: 5px; border-radius: 3px"
            >${challenge.tag}</span
            ></span
            >
        </div>
    </div>
    <div class="compiler-section">
        <h2>Code Runner</h2>
        <select onchange="changeBoilerCode(this)" id="language">
            <option value="java">Java</option>
            <option value="python3">Python</option>
            <option value="cpp">C++</option>
        </select
        ><br/><br/>
        <textarea
                id="editor"
                rows="10"
                cols="50"
                placeholder="Enter your code here..."
        ></textarea
        ><br/>
        <button onclick="runCode()">Run Code</button>
        <button onclick="submitCode()">Submit Code</button>
        <h3>Input:</h3>
        <textarea id="input" rows="5" cols="50" placeholder="Enter your input here..."></textarea><br/>
        <h3>Output:</h3>
        <pre id="output">Output is displayed here...</pre>
        <h3>Test Cases Passed:</h3>
        <pre id="testcase-result">Test case results will be displayed here...</pre>
    </div>
</section>
<script>
    let code = document.getElementById("editor").value;
    let language = document.getElementById("language").value;
    const input = document.getElementById("input").value;

    document.getElementById("editor").value = `public class Main {
  public static void main(String[] args) {
    // Write your code here...
    
  }
}`;

    const changeBoilerCode = (e) => {
        if (e.value == "java") {
            document.getElementById("editor").value = `public class Main {
  public static void main(String[] args) {
    // Write your code here...
    
  }
}`;
        } else if (e.value == "python3") {
            document.getElementById("editor").value = `# Write your code here...
`;
        } else if (e.value == "cpp") {
            document.getElementById("editor").value = `#include <bits/stdc++.h>

using namespace std;

int main() {
  // Write your code here...
  
  return 0;
}`;
        }
    };

    const proxyUrl = "https://cors-anywhere.herokuapp.com/";
    const apiUrl = "https://api.jdoodle.com/v1/execute";
    const fullUrl = proxyUrl + apiUrl;

    function runCode() {
        const code = document.getElementById("editor").value;
        const language = document.getElementById("language").value;
        const input = document.getElementById("input").value;

        const data = {
            script: code,
            language: language,
            stdin: input,
            versionIndex: "0",
            clientId: "72d2744723d73a3bd2f965bdca5b70d",
            clientSecret: "4358cf6d43dbc889c305f1b5eeabe8f9c4479757cc55e6553fca852af52cdab6",
        };

        fetch(fullUrl, {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify(data),
        })
            .then((response) => response.json())
            .then((data) => {
                console.log(data);
                document.getElementById("output").textContent = data.output || "No output";
            })
            .catch((error) => console.error("Error:", error));
    }

    function submitCode() {
        const code = document.getElementById("editor").value;
        const language = document.getElementById("language").value;
        const testcaseResult = document.getElementById("testcase-result");

        fetch(`/api/challenges/${challenge.challengeId}`)
            .then(response => response.json())
            .then(challenge => {
                let passedCount = 0;
                const testCases = challenge.testCases;
                testCases.forEach((testCase, index) => {
                    const data = {
                        script: code,
                        language: language,
                        stdin: testCase.testCaseInput,
                        versionIndex: "0",
                        clientId: "72d2744723d73a3bd2f965bdca5b70d",
                        clientSecret: "4358cf6d43dbc889c305f1b5eeabe8f9c4479757cc55e6553fca852af52cdab6",
                    };

                    fetch(fullUrl, {
                        method: "POST",
                        headers: {"Content-Type": "application/json"},
                        body: JSON.stringify(data),
                    })
                        .then((response) => response.json())
                        .then((data) => {
                            const actualOutput = data.output.trim();
                            const expectedOutput = testCase.testCaseOutput.trim();
                            console.log("Acutal: " + actualOutput + "\nExpected: " + expectedOutput);

                            if (actualOutput == expectedOutput) {
                                passedCount++;
                            }

                            if (index === testCases.length - 1) {
                                testcaseResult.textContent = "Passed " + passedCount + " out of " + testCases.length + " test cases.";
                                if (passedCount === testCases.length)
                                    window.location.href = "/submitCodeChecker/${challenge.challengeId}";
                            }
                        })
                        .catch((error) => console.error("Error:", error));
                    <%--window.location.href = "/submitCodeChecker/${challenge.challengeId}";--%>
                });
            })
            .catch(error => console.error("Error fetching challenge:", error));
    }

</script>
</body>
</html>
