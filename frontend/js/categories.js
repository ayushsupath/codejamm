/**
 * Categories specific functionality
 */

document.addEventListener('DOMContentLoaded', () => {
    // 1. Initialize Sticky Sidebar highlighting
    const sections = document.querySelectorAll('.content-section');
    const navLinks = document.querySelectorAll('.category-sidebar a');

    if (sections.length > 0 && navLinks.length > 0) {
        const observerOptions = {
            root: null,
            rootMargin: '-100px 0px -40% 0px',
            threshold: 0
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    // Remove active from all
                    navLinks.forEach(link => link.classList.remove('active'));
                    // Add active to current
                    const activeLink = document.querySelector(`.category-sidebar a[href="#${entry.target.id}"]`);
                    if (activeLink) {
                        activeLink.classList.add('active');
                    }
                }
            });
        }, observerOptions);

        sections.forEach(section => observer.observe(section));
    }

    // 2. Initialize LeetCode Checkboxes (LocalStorage)
    const lcCheckboxes = document.querySelectorAll('.lc-checkbox');
    const pageId = document.body.dataset.pageId || 'unknown-page'; // added to body tag to scope storage

    lcCheckboxes.forEach(checkbox => {
        const problemId = checkbox.dataset.problemId;
        const storageKey = `codejamm_lc_${pageId}_${problemId}`;
        
        // Load initial state
        const isChecked = localStorage.getItem(storageKey) === 'true';
        checkbox.checked = isChecked;
        toggleCompletionStyle(checkbox, isChecked);

        // Add event listener
        checkbox.addEventListener('change', (e) => {
            const checked = e.target.checked;
            localStorage.setItem(storageKey, checked);
            toggleCompletionStyle(e.target, checked);
        });
    });

    function toggleCompletionStyle(checkbox, isChecked) {
        const item = checkbox.closest('.lc-problem-item');
        if (item) {
            if (isChecked) {
                item.classList.add('completed');
            } else {
                item.classList.remove('completed');
            }
        }
    }

    // 3. Initialize Code Copy buttons
    const copyButtons = document.querySelectorAll('.code-copy-btn');
    copyButtons.forEach(btn => {
        btn.addEventListener('click', async () => {
            const pre = btn.parentElement.nextElementSibling;
            if (pre && pre.tagName === 'PRE') {
                const code = pre.textContent;
                try {
                    await navigator.clipboard.writeText(code);
                    const originalText = btn.innerHTML;
                    btn.innerHTML = '<i class="fas fa-check"></i> Copied!';
                    setTimeout(() => {
                        btn.innerHTML = originalText;
                    }, 2000);
                } catch (err) {
                    console.error('Failed to copy text: ', err);
                }
            }
        });
    });

    // 4. Smooth Scrolling for sidebar links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            const href = this.getAttribute('href');
            if (href.startsWith('#') && href.length > 1) {
                e.preventDefault();
                const target = document.querySelector(href);
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth'
                    });
                }
            }
        });
    });
});

/**
 * Saves code to sessionStorage and redirects to compiler page
 * @param {string} codeId ID of the code block element to copy from
 */
function tryInCompiler(codeId) {
    const codeElement = document.getElementById(codeId);
    if (codeElement) {
        // Get raw text without syntax highlighting tags
        const rawCode = codeElement.textContent || codeElement.innerText;
        sessionStorage.setItem('compilerCode', rawCode);
        window.location.href = 'compiler.html';
    } else {
        console.error('Code element not found: ' + codeId);
    }
}
