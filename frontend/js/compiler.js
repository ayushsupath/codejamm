// Compiler Page JavaScript

let editor;
let isExecuting = false;

// Initialize when page loads
document.addEventListener('DOMContentLoaded', function() {
    initializeEditor();
    setupEventListeners();
});

/**
 * Initialize Monaco Editor
 */
function initializeEditor() {
    require.config({ paths: { vs: 'https://cdn.jsdelivr.net/npm/monaco-editor@0.44.0/min/vs' } });
    
    require(['vs/editor/editor.main'], function() {
        editor = monaco.editor.create(document.getElementById('code-editor'), {
            value: SAMPLE_PROGRAMS.hello.code,
            language: 'java',
            theme: 'vs-dark',
            automaticLayout: true,
            fontSize: 14,
            minimap: { enabled: true },
            scrollBeyondLastLine: false,
            wordWrap: 'on',
            formatOnPaste: true,
            formatOnType: true
        });
    });
}

/**
 * Setup event listeners
 */
function setupEventListeners() {
    // Run code button
    document.getElementById('run-btn').addEventListener('click', runCode);
    
    // Clear button
    document.getElementById('clear-btn').addEventListener('click', clearCode);
    
    // Clear input button
    document.getElementById('clear-input-btn').addEventListener('click', () => {
        document.getElementById('input-area').value = '';
    });
    
    // Clear output button
    document.getElementById('clear-output-btn').addEventListener('click', clearOutput);
    
    // Copy code button
    document.getElementById('copy-code-btn').addEventListener('click', copyCode);
    
    // Format code button
    document.getElementById('format-code-btn').addEventListener('click', formatCode);
    
    // Sample program buttons
    document.querySelectorAll('.sample-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const sampleName = this.getAttribute('data-sample');
            loadSample(sampleName);
        });
    });
}

/**
 * Run the Java code
 */
async function runCode() {
    if (isExecuting) {
        return;
    }

    const code = editor.getValue();
    const input = document.getElementById('input-area').value;

    if (!code.trim()) {
        showOutput('Please write some code first!', 'error');
        return;
    }

    isExecuting = true;
    const runBtn = document.getElementById('run-btn');
    const originalBtnText = runBtn.innerHTML;
    runBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Running...';
    runBtn.disabled = true;

    showOutput('Compiling and executing...', 'info');

    try {
        const startTime = Date.now();
        const result = await compileAndExecute(code, input);
        const executionTime = Date.now() - startTime;

        if (result.success) {
            showOutput(result.output, 'success', executionTime);
        } else {
            showOutput(result.error, 'error', executionTime);
        }
    } catch (error) {
        showOutput('Error: ' + error.message, 'error');
    } finally {
        isExecuting = false;
        runBtn.innerHTML = originalBtnText;
        runBtn.disabled = false;
    }
}

/**
 * Display output
 */
function showOutput(message, type = 'info', executionTime = null) {
    const outputArea = document.getElementById('output-area');
    
    let className = 'output-' + type;
    let icon = type === 'success' ? 'check-circle' : (type === 'error' ? 'times-circle' : 'info-circle');
    
    let html = `
        <div class="${className}">
            <div style="display: flex; align-items: center; gap: 0.5rem; margin-bottom: 0.75rem;">
                <i class="fas fa-${icon}"></i>
                <strong>${type.toUpperCase()}</strong>
            </div>
            <pre style="white-space: pre-wrap; word-wrap: break-word; margin: 0;">${message}</pre>
    `;
    
    if (executionTime !== null) {
        html += `<div class="execution-time" style="margin-top: 1rem; padding-top: 0.75rem; border-top: 1px solid rgba(255,255,255,0.1); font-size: 0.9rem; color: #94a3b8;">Execution time: ${executionTime}ms</div>`;
    }
    
    html += `</div>`;
    
    outputArea.innerHTML = html;
}

/**
 * Clear the code editor
 */
function clearCode() {
    if (confirm('Are you sure you want to clear the code?')) {
        editor.setValue('');
    }
}

/**
 * Clear the output area
 */
function clearOutput() {
    document.getElementById('output-area').innerHTML = `
        <div class="output-placeholder">
            <i class="fas fa-info-circle"></i>
            <p>Click "Run Code" to see the output here</p>
        </div>
    `;
}

/**
 * Copy code to clipboard
 */
function copyCode() {
    const code = editor.getValue();
    navigator.clipboard.writeText(code).then(() => {
        const btn = document.getElementById('copy-code-btn');
        const originalHTML = btn.innerHTML;
        btn.innerHTML = '<i class="fas fa-check"></i>';
        setTimeout(() => {
            btn.innerHTML = originalHTML;
        }, 2000);
    });
}

/**
 * Format code (basic formatting)
 */
function formatCode() {
    editor.getAction('editor.action.formatDocument').run();
}

/**
 * Load a sample program
 */
function loadSample(sampleName) {
    const sample = SAMPLE_PROGRAMS[sampleName];
    if (sample) {
        editor.setValue(sample.code);
        clearOutput();
        
        // Show notification
        showOutput(`Loaded sample: ${sample.name}`, 'info');
        setTimeout(clearOutput, 2000);
    }
}

/**
 * Keyboard shortcuts
 */
document.addEventListener('keydown', function(e) {
    // Ctrl/Cmd + Enter to run code
    if ((e.ctrlKey || e.metaKey) && e.key === 'Enter') {
        e.preventDefault();
        runCode();
    }
    
    // Ctrl/Cmd + K to clear code
    if ((e.ctrlKey || e.metaKey) && e.key === 'k') {
        e.preventDefault();
        clearCode();
    }
});
