class Solution(object):
    def sampleStats(self, count):
        """
        :type count: List[int]
        :rtype: List[float]
        """
        total = sum(count)
        
        # min
        minimum = next(i for i, c in enumerate(count) if c > 0)
        
        # max
        maximum = next(i for i in range(255, -1, -1) if count[i] > 0)
        
        # mean
        total_sum = sum(i * c for i, c in enumerate(count))
        mean = total_sum / float(total)
        
        # mode
        mode = max(range(256), key=lambda i: count[i])
        
        # median
        mid1 = (total + 1) // 2
        mid2 = (total + 2) // 2
        curr = 0
        m1 = m2 = None
        
        for i, c in enumerate(count):
            curr += c
            if m1 is None and curr >= mid1:
                m1 = i
            if curr >= mid2:
                m2 = i
                break
        
        median = (m1 + m2) / 2.0
        
        return [float(minimum), float(maximum), mean, median, float(mode)]
