		<script src="/js/modal.js"></script>
		<?php foreach ($scripts as $key => $script): ?>
			<script src="/js/<?php echo $controller; ?>/<?php echo $script; ?>.js"></script>
		<?php endforeach; ?>
	</body>
</html>
